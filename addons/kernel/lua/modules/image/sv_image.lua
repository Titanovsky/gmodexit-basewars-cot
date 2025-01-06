local AddString = AMB.Network.AddString

local net_send_all = AddString( AMB.Image.Config.net_send_all )
function AMB.Image.SendAll( sUrl )

	net.Start( net_send_all )
	net.WriteString( sUrl )
	net.Broadcast()

end

hook.Add( 'PlayerSay', 'ХУЙ', function( ePly, sText ) 

	if ePly:IsSuperAdmin() and ( string.sub( sText, 1, 19 ) == 'https://i.imgur.com' ) then AMB.Image.SendAll( sText ) return false end

end )


