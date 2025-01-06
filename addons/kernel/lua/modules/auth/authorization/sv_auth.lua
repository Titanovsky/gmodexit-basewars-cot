local CFG = AMB.Auth.Config

local db = AMB.SQL.CreateTable( CFG.db_stats, 'SteamID TEXT, Gamename TEXT, Level NUMBER, XP NUMBER, Money NUMBER, Skin TEXT' )
local skins = {

    'models/player/Group01/female_01.mdl',
    'models/player/Group01/female_02.mdl',
    'models/player/Group01/female_03.mdl',
    'models/player/Group01/female_04.mdl',
    'models/player/Group01/female_05.mdl',
    'models/player/Group01/female_06.mdl',
    'models/player/Group01/male_01.mdl',
    'models/player/Group01/male_02.mdl',
    'models/player/Group01/male_03.mdl',
    'models/player/Group01/male_04.mdl',
    'models/player/Group01/male_05.mdl',
    'models/player/Group01/male_06.mdl',
    'models/player/Group01/male_07.mdl',
    'models/player/Group01/male_08.mdl',
    'models/player/Group01/male_09.mdl',
    'models/player/Group02/male_02.mdl',
    'models/player/Group02/male_04.mdl',
    'models/player/Group02/male_06.mdl',
    'models/player/Group02/male_08.mdl',
    'models/player/hostage/hostage_01.mdl',
    'models/player/hostage/hostage_02.mdl',
    'models/player/hostage/hostage_03.mdl',
    'models/player/hostage/hostage_04.mdl'

}

function AMB.Auth.Start( ePly )

    AMB.NW.SetBool( ePly, 'Auth', false )
    ePly:Freeze( true )

end

local function FromDataBase( sName, ePly, bToNumber )

    local val = bToNumber and tonumber( AMB.SQL.Select( db, sName, 'SteamID', ePly:SteamID() ) ) or AMB.SQL.Select( db, sName, 'SteamID', ePly:SteamID() )

    return val
    
end

function AMB.Auth.Finish( ePly )

    if AMB.Auth.IsPlayer( ePly ) then return end
    if not AMB.SQL.IsSelect( db, 'Gamename', 'SteamID', ePly:SteamID() ) then AMB.ErrorLog( 'Auth', 'Authorization of player '..ePly:SteamID()..' has failed' ) return end

    local gamename = FromDataBase( 'Gamename', ePly )
    AMB.NW.SetString( ePly, 'Gamename', gamename )

    local money = FromDataBase( 'Money', ePly, true )
    AMB.NW.SetInt( ePly, 'Money', money )

    local level = FromDataBase( 'Level', ePly, true )
    AMB.NW.SetInt( ePly, 'Level', level )

    local xp = FromDataBase( 'XP', ePly, true )
    AMB.NW.SetInt( ePly, 'XP', xp )

    local skin = FromDataBase( 'Skin', ePly )
    AMB.NW.SetString( ePly, 'Skin', skin )
    ePly:SetModel( skin )

    local nxp = AMB.Gamemode.Config.calc_nxp_instance * level
    AMB.NW.SetInt( ePly, 'NXP', nxp )

    AMB.NW.SetBool( ePly, 'Auth', true )
    ePly:Freeze( false )

    timer.Remove( 'CheckAuthPlayer:'..ePly:SteamID() )

    AMB.ConsoleLog( 'Auth', 'Player '..gamename..'('..ePly:SteamID64()..') finished authorization' )

    hook.Call( 'AmbitionPlayerAuthorized', nil, ePly ) -- wrong old name, but it is used in modules
    hook.Call( 'AmbitionAuthPlayer', nil, ePly )

end

function AMB.Auth.RegistrationToEnd( ePly )

    local ID = ePly:SteamID()
    local nick = AMB.Auth.VerificateName( ePly:Nick() )
    local skin = table.Random( skins )

    AMB.SQL.Get( db, 'SteamID', 'SteamID', ID, function() end, function()
        
        local CFG = AMB.Gamemode.Config
        AMB.SQL.Insert( db, 'SteamID, Gamename, Level, XP, Money, Skin', '%s, %s, %i, %i, %i, %s', ID, nick, CFG.start_level, CFG.start_xp, CFG.start_money, skin )
        AMB.ConsoleLog( 'Auth', 'Player '..nick..'('..ePly:SteamID64()..') the first time joined on server' )
        timer.Simple( 0.25, function() AMB.Quest.Start( ePly, 1 ) end )

    end )

    ePly:RunCommand( 'amb_hud_cot 3' )
    ePly:RunCommand( 'amb_propcore_hud_info 1' )

    AMB.Auth.Finish( ePly )

    if string.StartWith( nick, 'Unknow#' ) then AMB.UI.Chat.SendMessage( ePly, 'ambition/misc/ding/ding1.wav', C.FLAT_RED, 'Упс.. Ваш ник был изменён, обратитесь к администраций для его смены!' ) end

end

function AMB.Auth.Check( ePly, sCode, sWarning )

    if not IsValid( ePly ) or not ePly:IsPlayer() then return false end
    if not AMB.Auth.IsPlayer( ePly ) then AMB.Adminus.KickCheater( ePly, sCode, sWarning ) return false end

    return true

end

function AMB.Auth.GetDatabasePlayer( ePly, sKey )

    return AMB.SQL.Select( db, sKey, 'SteamID', ePly:SteamID() )

end

local net_string = AMB.Network.AddString( 'amb_auth_reg_finish' )
net.Receive( net_string, function( nLen, ePly )

    if AMB.Auth.IsPlayer( ePly ) then AMB.Adminus.KickCheater( ePly, '3au000A', 'Авторизованный ~p~ попытался авторизоваться ещё раз' ) return end

    if AMB.Auth.GetDatabasePlayer( ePly, 'SteamID' ) then AMB.Auth.Finish( ePly )
    else AMB.Auth.RegistrationToEnd( ePly )
    end

end )

hook.Add( 'PlayerInitialSpawn', 'AMB.Auth.KickNonAuthPlayerFor15Min', function( ePly )

    timer.Create( 'CheckAuthPlayer:'..ePly:SteamID(), 60 * 15, 1, function()

        if not IsValid( ePly ) then return end

        ePly:Kick( 'Вы не успели авторизоваться!' )

    end )

end )

hook.Add( 'PlayerSpawn', 'AMB.Auth.SetSkin', function( ePly )

    timer.Simple( 0, function() 

        local skin = AMB.Gamemode.GetStats( ePly, 'Skin' )
        ePly:SetModel( skin )

    end )

end )