AMB.Re = AMB.Re or {}

local C = AMB.G.C
local SND = AMB.G.SND

function AMB.Re.ChatError( ePly, sText )

    AMB.UI.Chat.SendMessage( ePly, SND.ERROR, C.AMB_ERROR, '[•] ', C.ABS_WHITE, sText )

end

function AMB.Re.ChatLog( ePly, cColor, sText )

    AMB.UI.Chat.SendMessage( ePly, nil, cColor, '[•] ', C.ABS_WHITE, sText )

end

function AMB.Re.Notify( ePly, tOptions )

    AMB.UI.Notify.DrawNotify( ePly, 3, tOptions )

end

local GetStats, AddStats = AMB.Gamemode.GetStats, AMB.Gamemode.AddStats
local PLAYER = FindMetaTable( 'Player' )

PLAYER.AddMoney = function( self, nCount, bDontNotify )

    if not self:IsAuth() then return end
    bDontNotify = bDontNotify or false

    AddStats( self, 'Money', nCount, not bDontNotify )

end

PLAYER.AddXP = function( self, nCount, bDontNotify )

    if not self:IsAuth() then return end
    bDontNotify = bDontNotify or false

    AddStats( self, 'XP', nCount, not bDontNotify )

end

PLAYER.NotifySend = function( self, tOptions )

    if not tOptions or not istable( tOptions ) then return end

    AMB.UI.Notify.DrawNotify( self, 3, tOptions )

end

PLAYER.ChatSend = function( self, ... )

    local varargs = { ... }

    AMB.UI.Chat.SendMessage( self, nil, unpack( varargs ) )

end

PLAYER.SoundSend = function( self, sSound )

    AMB.UI.Sounds.PlaySound( self, sSound or '' )

end

local net_send_client_con_command = AMB.Network.AddString( 'amb_re_send_client_con_command' )
PLAYER.RunCommand = function( self, sCommand )

    net.Start( net_send_client_con_command )
        net.WriteString( sCommand or '' )
    net.Send( self )

end