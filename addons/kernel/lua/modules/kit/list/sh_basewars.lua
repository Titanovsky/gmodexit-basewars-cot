local C, SND = AMB.G.C, AMB.G.SND
local ONCE = true
local minutes, hour, day = 60, 60 * 60, 60 * 60 * 24
local Add = AMB.Kit.Add

Add( 'basewars', 'Специально для Capture of Terra', ONCE, 0, function( ePly )

    ePly:AddXP( 500 )
    ePly:AddMoney( 2000 )

end )

Add( 'ak47', 'Калашик и патрончики', not ONCE, hour, function( ePly )

    ePly:Give( 'arccw_ak47' )
    ePly:Give( 'arccw_ammo_ar2_large' )
    ePly:Give( 'arccw_ammo_ar2_large' )

end )