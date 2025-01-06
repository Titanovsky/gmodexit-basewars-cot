local C, SND = AMB.G.C, AMB.G.SND
local ONCE = true
local minutes, hour, day = 60, 60 * 60, 60 * 60 * 24
local Add = AMB.Kit.Add

Add( 'starter', 'Стандартный набор', not ONCE, hour * 12, function( ePly )

    if ( ePly:GetLevel() > 8 ) then ePly:ChatSend( C.AMB_RED, 'А всё, уже нельзя :)' ) return end

    ePly:AddXP( 100 )
    ePly:AddMoney( 1000 )

    if ePly:Alive() then

        ePly:Give( 'weapon_stunstick' )
        ePly:Give( 'arccw_makarov' )
        ePly:SetArmor( ePly:Armor() + 50 )
        ePly:SetHealth( ePly:Health() + 25 )

    end

end )

Add( 'bonus', 'Бонус', ONCE, 0, function( ePly )

    ePly:AddXP( 500 )
    ePly:AddMoney( 5000 )

    if ePly:Alive() then

        ePly:Give( 'weapon_stunstick' )
        ePly:Give( 'arccw_makarov' )
        ePly:SetArmor( ePly:Armor() + 100 )
        ePly:SetHealth( ePly:Health() + 80 )

    end

end )