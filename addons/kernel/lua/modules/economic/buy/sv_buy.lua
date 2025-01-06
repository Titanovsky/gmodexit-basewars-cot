local CFG = AMB.Economic.Config
local C = AMB.G.C
local SND = AMB.G.SND
local UT = AMB.Utility

AMB.Economic.players_max_limits_entities = AMB.Economic.players_max_limits_entities or {}

function AMB.Economic.AddLimit( ePly, sTag )

    local max = AMB.Economic.players_max_limits_entities[ ePly:SteamID() ][ sTag ]
    if not max then max = 0 end

    AMB.Economic.players_max_limits_entities[ ePly:SteamID() ][ sTag ] = max + 1

end

function AMB.Economic.GetLimit( ePly, sTag )

    return AMB.Economic.players_max_limits_entities[ ePly:SteamID() ][ sTag ] or 0

end

function AMB.Economic.GetMax( sTag )

    local CFG = AMB.Economic.Config
    if not CFG.shop_entities[ sTag ] then return 0 end

    return CFG.shop_entities[ sTag ].max or 1

end

function AMB.Economic.Buy( ePly, sTag, sType )

    local CFG = AMB.Economic.Config
    local item = nil
    sType = string.lower( sType )

    if ( sType == 'weapon' ) then item = CFG.shop_weapons[ sTag ]
    elseif ( sType == 'entity' ) then item = CFG.shop_entities[ sTag ]
    end

    if not item then return end
    if not AMB.Economic.Check( ePly, sTag, sType ) then return end

    if ( sType == 'weapon' ) then

        ePly:Give( item.class )

        local weapon = ePly:GetActiveWeapon()
        if item.ammo then ePly:SetAmmo( item.ammo, weapon:GetPrimaryAmmoType() ) end
        if item.post then item.post( ePly, weapon ) end

        hook.Call( 'AmbitionEconomicBuyWeapon', nil, ePly, sTag, item )

    elseif ( sType == 'entity' ) then

        local ent = ents.Create( item.class )
        ent:SetPos( UT.GetFrontPos( ePly, 80 ) )
        ent:SetAngles( ePly:EyeAngles() )
        ent:Spawn()
        ent.restrict_physgun = true
        ent.economic_the_buyer_steamid = ePly:SteamID()
        ent.economic_tag = sTag
        if item.post then item.post( ePly, ent ) end

        ePly:PropCoreAdd( ent )

        hook.Call( 'AmbitionEconomicBuyEntity', nil, ePly, sTag, item )

    end

    ePly:AddMoneyEco( -item.cost )
    AMB.Economic.AddLimit( ePly, sTag )

end

hook.Add( 'AmbitionPlayerAuthorized', 'AMB.Economic.SetMaxEntitiesTable', function( ePly ) 

    AMB.Economic.players_max_limits_entities[ ePly:SteamID() ] = AMB.Economic.players_max_limits_entities[ ePly:SteamID() ] or {} 

end )

hook.Add( 'EntityRemoved', 'AMB.Economic.MinusLimitEntity', function( eObj )

    local tag, buyer_steamid = eObj.economic_tag, eObj.economic_the_buyer_steamid
    if not tag then return end

    local max = AMB.Economic.players_max_limits_entities[ buyer_steamid ][ tag ]
    if not max or ( max == 0 ) then return end
    AMB.Economic.players_max_limits_entities[ buyer_steamid ][ tag ] = max - 1

end )

local net_buy = AMB.Network.AddString( CFG.net_buy )
net.Receive( net_buy, function( nLen, ePly ) 

    if not ePly:IsAuth() then AMB.Adminus.KickCheater( ePly, '3ec000B', 'Неавторизованный ~p~ попытался купить предмет' ) return end

    local tag = net.ReadString()
    local type = net.ReadString()
    if not type or not tag then return end

    if timer.Exists( 'TimeDelayBuyShop:'..ePly:SteamID() ) then return end
    if not AMB.Economic.Check( ePly, tag, type ) then AMB.Adminus.KickCheater( ePly, '3ec010B', '~p~ попытался купить предмет в обход Check( Level и Money )' ) return end
    
    local item = AMB.Economic.GetShopItem( tag, type )
    if ( type == 'entity' ) then

        local limit, max = AMB.Economic.GetLimit( ePly, tag ), AMB.Economic.GetMax( tag )
        if ( limit >= max ) then AMB.Re.Notify( ePly, { type = 1, sound = SND.ERROR, time = 6, color = C.AMB_ERROR, text = 'Вы достигли лимита '..item.name..' '..limit..'/'..max } ) return end

    elseif ( type == 'weapon' ) then

        if ePly:HasWeapon( item.class ) then AMB.Re.Notify( ePly, { type = 1, sound = SND.ERROR, time = 6, color = C.AMB_ERROR, text = 'У Вас уже есть '..item.name } ) return end

    end

    AMB.Economic.Buy( ePly, tag, type )
    timer.Create( 'TimeDelayBuyShop:'..ePly:SteamID(), 0.5, 1, function() end )

end )