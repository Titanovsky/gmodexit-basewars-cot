local CFG, C, SND, SQL = AMB.Kit.Config, AMB.G.C, AMB.G.SND, AMB.SQL
local db = SQL.CreateTable( CFG.db, 'SteamID TEXT, Kit TEXT, Date NUMBER' )
local Player = FindMetaTable( 'Player' )

local function ShowError( ePly, sError, bShowError )

    if not bShowError then return end

    ePly:NotifySend( { type = 1, color = C.AMB_ERROR, sound = SND.ERROR, time = 8, text = sError or '' } )

end

function Player:CheckKit( sName, bShowError )

    sName = sName or ''

    local kit = AMB.Kit.Get( sName )
    if not kit then ShowError( self, 'Набора '..sName..' не существует!', bShowError ) return false end

    local date = sql.QueryValue( 'SELECT Date FROM '..db..' WHERE Kit = "'..sName..'" AND SteamID = "'..self:SteamID()..'"' )
    if not date then return true end
    date = tonumber( date )

    if kit.once then ShowError( self, 'Набор '..sName..' единоразовый!', bShowError ) return false end
    
    local delay = date + kit.delay
    if ( os.time() < delay ) then ShowError( self, 'Набор будет доступен '..os.date( '%x %X', delay ), bShowError ) return false end

    return true

end

function Player:GiveKit( sName, bNoCheck )

    if not self:IsAuth() then return end

    sName = sName or ''

    local kit = AMB.Kit.Get( sName )
    if not kit then self:ChatSend( C.FLAT_RED, '[Kits] ', C.ABS_WHITE, 'Набора ', C.FLAT_RED, sName, ' не существует!' ) return end
    if not bNoCheck and not self:CheckKit( sName, true ) then return end

    kit.action( self )

    local date = sql.QueryValue( 'SELECT Date FROM '..db..' WHERE Kit = "'..sName..'" AND SteamID = "'..self:SteamID()..'"' )
    if date then

        SQL.UpdateDouble( db, 'Date', os.time(), 'SteamID', self:SteamID(), 'Kit', sName )

    else

        SQL.Insert( db, 'SteamID, Kit, Date', '%s, %s, %i', self:SteamID(), sName, os.time() )

    end

    self:ChatSend( C.FLAT_RED, '[Kits] ', C.ABS_WHITE, 'Вам выдан набор ', C.FLAT_RED, sName )

end