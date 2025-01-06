AMB.Gamemode = AMB.Gamemode or {}

local C = AMB.G.C

function AMB.Gamemode.NotifyPostKill( eVictim, eInflictor, eAttacker )

    local CFG = AMB.Gamemode.Config

    if not CFG.notify_post_kill then return end
    if not IsValid( eAttacker ) or not eAttacker:IsPlayer() then return end

    AMB.UI.Notify.DrawNotify( eAttacker, CFG.notify_type, { text = 'Вы убили '..AMB.Gamemode.GetStats( eVictim, 'Gamename' ), time = 4, color = C.ABS_BLACK, textcolor = C.ABS_WHITE } )
    AMB.UI.Notify.DrawNotify( eVictim, CFG.notify_type, { text = 'Вас убил '..AMB.Gamemode.GetStats( eAttacker, 'Gamename' ), time = 4, color = C.ABS_BLACK, textcolor = C.ABS_WHITE } )

end
hook.Add( 'PlayerDeath', 'AMB.Gamemode.NotifyPostKill', AMB.Gamemode.NotifyPostKill )