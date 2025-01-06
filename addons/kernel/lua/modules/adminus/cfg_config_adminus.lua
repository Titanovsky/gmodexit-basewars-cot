AMB.Adminus = AMB.Adminus or {}
AMB.Adminus.Config = AMB.Adminus.Config or {}

-- Databases --
AMB.Adminus.Config.db_bans = 'amb_adminus_bans'

-- Nets --
AMB.Adminus.Config.net_execute_console_command = 'amb_adminus_execute_console_command'

-- ConVars --
AMB.Adminus.Config.color_frame = { cvar = 'amb_adminus_color_frame', default = '255 255 255 255' }

-- Users --
AMB.Adminus.Config.ranks = { 

    [ 'user' ]      = { access = 0, true_name = 'The User', description = 'Обычный игрок.' },
    [ 'recruit' ]  = { access = 1, true_name = 'Recruiter', description = 'Рекрут.' },
    [ 'moder' ]  = { access = 2, true_name = 'Moderator', description = 'Модераторус.' },
    [ 'admin' ]    = { access = 3, true_name = 'Administrator', description = 'Администратор.' },
    [ 'curator' ]   = { access = 4, true_name = 'Curator', description = 'Главный Ответственный разработчик за весь сервер.' },
    [ 'creator' ]   = { access = 99, true_name = 'The Creator', description = 'Основоположники сервера.' }

}

AMB.Adminus.Config.privileges = {
}

AMB.Adminus.Config.modes = { 

    [ 'admin' ] = { description = 'AdminMode', func = function( ePly ) end },
    [ 'dev' ]   = { description = 'DevMode', func = function( ePly ) end }

}

function AMB.Adminus.ReloadConfig()

    for name, tbl in pairs( AMB.Adminus.Config.ranks ) do AMB.Adminus.Ranks.Add( name, tbl.access, tbl.true_name, tbl.description ) end
    for name, tbl in pairs( AMB.Adminus.Config.privileges ) do AMB.Adminus.Privileges.Add( name, tbl.access, tbl.true_name, tbl.description ) end
    for name, tbl in pairs( AMB.Adminus.Config.modes ) do AMB.Adminus.Modes.Add( name, tbl.description, tbl.func ) end

end