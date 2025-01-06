local CFG, C, SND = AMB.ESP.Config, AMB.G.C, AMB.G.SND
local AddNetwork = AMB.Network.AddString

local net_string = AddNetwork( CFG.net_set_point )

local Player = FindMetaTable( 'Player' )

function Player:SetPointESP( sHeader, vPos, sImage, cColor )

    if not sHeader then return end

    net.Start( net_string )
        net.WriteString( sHeader )
        net.WriteVector( vPos or Vector( 0, 0, 0 ) )
        net.WriteString( sImage or 'icon16/bullet_red.png' )
        net.WriteColor( cColor or C.ABS_WHITE )
    net.Send( self )
 
end