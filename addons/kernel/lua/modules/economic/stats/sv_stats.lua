local C = AMB.G.C
local GetStats, AddStats, Notify = AMB.Gamemode.GetStats, AMB.Gamemode.AddStats

local PLAYER = FindMetaTable( 'Player' )
local max_bonus_lvl = 20

local CONST_BONUS_MONEY = 11
local function CalcMultiplyMoney( nLevel, nMoney )

    if ( nMoney <= 100 ) then return 0 end
    if ( nLevel >= max_bonus_lvl ) then return 0 end

    local rand_money = math.random( 6, 24 )
    local money_divided = math.floor( nMoney / 6 )

    return ( max_bonus_lvl - nLevel ) * rand_money + money_divided + 11

end

local CONST_BONUS_XP = 28
local function CalcMultiplyXP( nLevel, nXP )

    if ( nXP <= 100 ) then return 0 end
    if ( nLevel >= max_bonus_lvl ) then return 0 end

    local rand_xp = math.random( 20, 75 )
    local xp_divided = math.floor( nXP / 6 )

    return ( max_bonus_lvl - nLevel ) * rand_xp + xp_divided + CONST_BONUS_XP

end

local function CalcTaxClanXP( nTax, nXP )

    return math.floor( nXP * nTax )

end

PLAYER.AddMoneyEco = function( self, nCount, bDontNotify, bDontMultiply )

    if not self:IsAuth() then return end
    if not nCount or not isnumber( nCount ) then return end

    bDontNotify = bDontNotify or false
    nCount = math.floor( nCount )

    local modify_bonus = bDontMultiply and 0 or CalcMultiplyMoney( GetStats( self, 'Level' ), nCount )
    if ( modify_bonus > 0 ) then AMB.Re.Notify( self, { type = 16, color = C.FLAT_GREEN, time = 3.25, text = 'Bonus: +'..modify_bonus, color_text = C.FLAT_GREEN } ) end

    nCount = nCount + modify_bonus

    AddStats( self, 'Money', nCount, not bDontNotify )

end

PLAYER.AddXPEco = function( self, nCount, bDontNotify, bDontMultiply, bDontTaxClan )

    if not self:IsAuth() then return end
    if not nCount or not isnumber( nCount ) then return end

    bDontNotify = bDontNotify or false
    nCount = math.floor( nCount )

    local modify_bonus = bDontMultiply and 0 or CalcMultiplyXP( GetStats( self, 'Level' ), nCount )
    if ( modify_bonus > 0 ) then AMB.Re.Notify( self, { type = 14, color = C.FLAT_PURPLE, time = 3.25, text = 'Bonus: +'..modify_bonus..' XP', color_text = C.FLAT_PURPLE } ) end

    nCount = nCount + modify_bonus

    if self:IsClan() then

        local tax = bDontTaxClan and 0 or CalcTaxClanXP( AMB.Clans.PlayerGetClanTax( self ), nCount )

        if ( tax > 0 ) then 
        
            local clan_id = AMB.Clans.PlayerGetClanID( self )
            AMB.Clans.AddXP( clan_id, tax )
            nCount = nCount - tax

            AMB.Re.Notify( self, { type = 14, color = C.FLAT_DARK_PURPLE, time = 4.25, text = 'Clan: +'..tax..' XP', color_text = C.RU_PINK } ) 

        end

    end

    AddStats( self, 'XP', nCount, not bDontNotify )

end

local Kick = AMB.Adminus.KickCheater
local net_transfer_money = AMB.Network.AddString( 'amb_economic_transfer_money' )
net.Receive( net_transfer_money, function( nLen, ePly )

    if not ePly:IsAuth() then Kick( ePly, '3ec000S', 'Неавторизованный ~p~ попытался передать деньги' ) return end

    local player_receiver = net.ReadUInt( 8 )
    if not player_receiver then return end
    player_receiver = Entity( player_receiver )
    if not IsValid( player_receiver ) or not player_receiver:IsPlayer() then Kick( ePly, '3ec010S', '~p~ попытался передать деньги не игроку' ) return end
    if not player_receiver:IsAuth() then Kick( ePly, '3ec020S', '~p~ попытался передать деньги неавторизованному игроку' ) return end

    local money = net.ReadUInt( 24 )
    if not money then return end
    money = math.floor( money )
    if ( AMB.Gamemode.GetStats( ePly, 'Money' ) < money ) then Kick( ePly, '3ec030S', '~p~ попытался передать деньги, которых у него нет' ) return end
    if ( money <= 0 ) then Kick( ePly, '3ec040S', '~p~ попытался передать нулевые деньги' ) return end
    if ( money > 16777215 ) then Kick( ePly, '3ec050S', '~p~ попытался передать больше 16777215 денег' ) return end

    ePly:AddMoney( -money )
    AMB.Re.Notify( ePly, { time = 8, type = 1, text = 'Вы перечислили деньги игроку '..AMB.Gamemode.GetStats( player_receiver, 'Gamename' ), color = C.AMB_BLUE, color_text = C.AMB_BLUE } )

    player_receiver:AddMoney( money )
    AMB.Re.Notify( player_receiver, { time = 8, type = 1, text = 'Игрок '..AMB.Gamemode.GetStats( ePly, 'Gamename' )..' перечислил Вам деньги!', color = C.AMBITION, color_text = C.AMBITION } )

end )