local C, SQL = AMB.G.C, AMB.SQL

local db = SQL.CreateTable( AMB.Gamemode.Config.save_weapons_db, 'SteamID TEXT, Gamename TEXT, Weapons TEXT, Ammo TEXT' )

function AMB.Gamemode.SaveWeapons( ePly )

    if not IsValid( ePly ) or not ePly:IsPlayer() then return end
    if not ePly:IsAuth() or ( ePly:GetLevel() < AMB.Gamemode.Config.save_weapons_min_level ) then return end

    local weapons = ePly:GetWeapons()
    if not weapons or ( #weapons == 0 ) then return end

    local SteamID, Gamename, Weapons, Ammo = ePly:SteamID(), ePly:GetGamename(), AMB.Gamemode.ConvertWeaponsInStringData( weapons ), ''

    SQL.Get( db, 'Weapons', 'SteamID', SteamID, function()

        AMB.SQL.Update( db, 'Gamename', Gamename, 'SteamID', SteamID )
        AMB.SQL.Update( db, 'Weapons', Weapons, 'SteamID', SteamID )
        AMB.SQL.Update( db, 'Ammo', Ammo, 'SteamID', SteamID )

    end, function() 

        SQL.Insert( db, 'SteamID, Gamename, Weapons, Ammo', '%s, %s, %s, %s', SteamID, Gamename, Weapons, Ammo )

    end )

end

local block_classes = { [ 'weapon_physgun' ] = true, [ 'weapon_physcannon' ] = true, [ 'gmod_tool' ] = true }
function AMB.Gamemode.ConvertWeaponsInStringData( tWeapons )

    local str = ''
    for i, wep in ipairs( tWeapons ) do

        local class = wep:GetClass()

        if block_classes[ class ] then continue end
        local end_mark = ( i == #tWeapons ) and '' or ', '
        str = str..class..end_mark

    end

    return str

end

function AMB.Gamemode.ConvertStringDataInWeapons( sWeapons )

    return string.Explode( ', ', sWeapons )

end

function AMB.Gamemode.RemoveSaveWeapons( ePly )

    if not IsValid( ePly ) or not ePly:IsPlayer() then return end

    if SQL.IsSelect( db, 'Weapons', 'SteamID', ePly:SteamID() ) then SQL.Delete( db, 'SteamID', ePly:SteamID() ) end

end

function AMB.Gamemode.GiveSaveWeapons( ePly )

    if not IsValid( ePly ) or not ePly:IsPlayer() then return end
    if not SQL.IsSelect( db, 'Weapons', 'SteamID', ePly:SteamID() ) then return end

    local weapons = AMB.Gamemode.ConvertStringDataInWeapons( SQL.Select( db, 'Weapons', 'SteamID', ePly:SteamID() ) )

    for _, class in ipairs( weapons ) do ePly:Give( class ) end

    ePly:RemoveAllAmmo()

    AMB.Gamemode.RemoveSaveWeapons( ePly )

    ePly:ChatSend( C.AMB_GREEN, '[Хранилище] ', C.ABS_WHITE, 'Вам выдано оружие' )

end

hook.Add( 'PlayerDisconnected', 'AMB.Gamemode.SaveWeapons', AMB.Gamemode.SaveWeapons )
hook.Add( 'AmbitionAuthPlayer', 'AMB.Gamemode.GiveSaveWeapons', AMB.Gamemode.GiveSaveWeapons )
hook.Add( 'ShutDown', 'AMB.Gamemode.SaveWeapons', function() 

    for _, ply in ipairs( player.GetHumans() ) do AMB.Gamemode.SaveWeapons( ePly ) end

end )